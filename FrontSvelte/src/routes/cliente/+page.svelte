
<!-- Aqui se definen los estados y la funcion de envio de datos a la API -->
<script>
    import { writable } from 'svelte/store';
    import { z } from 'zod';
    import CargaArchivo from '../../componentes/CargaArchivo.svelte';
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
    name: z.string().min(1, "El nombre es requerido").max(50, "El nombre debe tener menos de 50 caracteres"),
    email: z.string().email("Debes proporcionar un correo electrónico válido"),
    password: z.string().min(8, "La contraseña debe tener al menos 8 caracteres").regex(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/, "La contraseña debe contener al menos una letra mayúscula, una letra minúscula y un número"),
    resumen: z.string().min(1, "El resumen es requerido").max(50, "El resumen debe tener menos de 50 caracteres"),
    descripcion: z.string().min(1, "La descripción es requerida").max(500, "La descripción debe tener menos de 500 caracteres"),
    ruc: z.string().min(10,"Minimo 11 digitos").max("Maximo 11 digitos").regex(/^\d+$/, "Solo numeros")});
    proyecto: z.string().min(1, "El proyecto es requerido")
    // Estado para el formulario
    let formData = writable({
    name: '',
    email: '',
    uploadedFileUrl: '',
    password: '',
    resumen: '',
    descripcion: '',
    ruc: '',
    proyecto : ''
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
    const validationResult = formSchema.safeParse($formData);

    if (!validationResult.success) {
        // Si la validación falla, mostramos los errores
        formErrors.set(validationResult.error.errors.reduce((acc, error) => {
        acc[error.path[0]] = error.message;
        return acc;
        }, {}));
    } else {
        console.log("Formulario válido:", $formData);

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

        }

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

    #name, #email, #password, #resumen, #descripcion, #ruc {
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
        <label for="name">Nombre:</label><br>
        <input id="name" type="text" bind:value={$formData.name} />
        {#if $formErrors.name}
            <span class="error">{$formErrors.name}</span>
        {/if}
        </div>
    
        <div>
        <label for="email">Correo electrónico:</label><br>
        <input id="email" type="email" bind:value={$formData.email} />
        {#if $formErrors.email}
            <span class="error">{$formErrors.email}</span>
        {/if}
        </div>
    
        <div>
            <label for="password"> Password: </label><br>
            <input id="password" type="password" bind:value={$formData.password} />
            {#if $formErrors.password}
                <span class="error">{$formErrors.password}</span>
            {/if}
        </div>


        <div>
            <label for="ruc"> RUC: </label><br>
            <input id="ruc" type="ruc" bind:value={$formData.ruc} />
            {#if $formErrors.ruc}
                <span class="error">{$formErrors.ruc}</span>
            {/if}
        </div>
    
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
