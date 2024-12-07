
<!-- Aqui se definen los estados y la funcion de envio de datos a la API -->
<script>
    import { writable } from 'svelte/store';
    import { z } from 'zod';
    import {fetchRecurso} from '../../servicios/buscarRecurso'
    import {onMount} from 'svelte'
    import {uploadFile} from '../../servicios/subirArchivo'

    const proyectos = writable([])
    let selectedResource = writable({id: 0, nombre: ''});
    let selectedProyectoName = '';
    let selectedFile = null;

    onMount(async () => {
        const response = await fetchRecurso("proyectos");
        proyectos.set(response)
        console.log($proyectos)
    });
    // Definir el esquema de validación usando Zod
    const formSchema = z.object({
    uploadedFileUrl: z.string().min(1, "El archivo es requerido"),
    resumen: z.string().min(1, "El resumen es requerido").max(50, "El resumen debe tener menos de 50 caracteres"),
    descripcion: z.string().min(1, "La descripción es requerida").max(500, "La descripción debe tener menos de 500 caracteres"),
    proyecto: z.number().min(1, "El proyecto es requerido"),
    tipo: z.string().min(1, "El tipo es requerido")
    });
    
    // Estado para el formulario
    let formData = writable({
    uploadedFileUrl: '',
    resumen: '',
    descripcion: '',
    proyecto : '',
    tipo: 'incidencia'
    });

    selectedResource.subscribe(value => {
        formData.update(data => {
            data.proyecto = value ? value.id : 0;
            return data;
        });
    });

    let formErrors = writable({});
    let isSubmitting = writable(false);

    // Función para manejar el envío del formulario
    const handleSubmit = async () => {
    isSubmitting.set(true);
    formErrors.set({});

      // Validar los datos del formulario
        if (selectedFile) {
                try {
                    const result = await uploadFile(selectedFile);
                    if (result.success) {
                        formData.update(data => {
                            data.uploadedFileUrl = result.file_url;
                            return data;
                        });
                    } else {
                        console.error(result.message || 'Error desconocido');
                    }
                } catch (error) {
                    console.error('Error al cargar el archivo:', error);
                }
            }

        const response = await fetch("http://localhost:5000/clienteDB", {
            method : "POST",
            headers: {
                    "Content-Type": "application/json"
                },
            body : JSON.stringify($formData)
        });

        if(!response.ok) {
            console.error("Error al enviar el formulario:", response.statusText);
        }

        const validationResult = formSchema.safeParse($formData);

        if (!validationResult.success) {
            // Si la validación falla, mostramos los errores
            formErrors.set(validationResult.error.errors.reduce((acc, error) => {
            acc[error.path[0]] = error.message;
            console.log("ERROR: ", error.message);
            return acc;
            }, {}));
        } else {
            console.log("Formulario válido:", $formData);

    }

    isSubmitting.set(false);
    };

    function handleChange(event) {
        selectedProyectoName = event.target.value;
        console.log(selectedProyectoName)
        const selectedProject = $proyectos.find(proyecto => proyecto.nombre === selectedProyectoName);
        console.log(selectedProject)
        selectedResource.set(selectedProject || { id: 0, nombre: '' });
        console.log("RECURSO: ", $selectedResource)
    }

    function handleFileChange(event) {
        selectedFile = event.target.files[0];
        console.log('Archivo seleccionado:', selectedFile);
    }
    
</script>


<!-- Estos son los estilos css del componente -->
<style>
    
    .error {
    color: red;
    font-size: 0.9em;
    }
    form, h1 {
        margin: auto;
        width: 60%;
        text-align: center;
    }
    h1 {
        padding-top: 1em;
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        padding-bottom: 1em;
        color:rgb(96, 100, 82);
        -webkit-text-stroke: 1.5px black;
    }
    div {
        margin-bottom: 2em;
        font-size: 1.2em;
    }

    .principal {
        background-color: rgb(255, 250, 180);
        border-radius: 2em;
        height:100%;
    }

    #resumen, #descripcion {
        width: 80%;
        font-size: 1em;
        border-radius: 0.4em;
    }
    #descripcion {
        max-width: 80%;
        min-height: 3em;
        max-height: 10em;
        height: 7em;
    }

    .envio {
        background-color: rgb(96, 100, 82);
        color: white;
        padding: 0.5em 1em;
        border-radius: 0.4em;
        font-size: 1.2em;
        cursor: pointer;
    }
</style>


<!-- Esta es la estructura principal del archivo-->

<div class="principal">
<h1>Formulario de contacto</h1>
    <form on:submit|preventDefault={handleSubmit}>
        
        <div> 
            <label for="proyectos"> Seleccione el proyecto sobre el que tiene una consulta: </label><br>
            <select id="proyectos" autocomplete="on" value={selectedProyectoName} on:change={handleChange}>
                <option value="" disabled>Selecciona un recurso</option>
                {#each $proyectos as proyecto}
                    <option value={proyecto.nombre}>{proyecto.nombre}</option>
                {/each}
            </select>
        </div>

        <div> 
            <label for="resumen"> Cual es el problema? Escriba el titulo: </label><br>
            <input id="resumen" type="text" bind:value={$formData.resumen} />
            {#if $formErrors.resumen}
                <span class="error">{$formErrors.resumen}</span>
            {/if}
        </div>
    
        <div>
            <label for="descripcion">Describa el problema</label><br>
            <textarea id="descripcion" bind:value={$formData.descripcion}></textarea>
            {#if $formErrors.descripcion}
                <span class="error">{$formErrors.descripcion}</span>
            {/if}
        </div>
        
        <div>
            <label for="file">Seleccionar archivo:</label><br>
            <input id="file" type="file" on:change={handleFileChange} /><br>
            {#if $formData.uploadedFileUrl}
                <p>Archivo subido correctamente. Visualizar 
                    <a href={$formData.uploadedFileUrl} target="_blank">aquí</a>
                </p>
            {/if}
        </div>
    
        <button class="envio" type="submit" disabled={$isSubmitting}>Enviar</button>
    </form>
</div>
