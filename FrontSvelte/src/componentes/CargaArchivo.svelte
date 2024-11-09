<script>
    import { uploadFile } from '../servicios/subirArchivo.js';
    
    let file = null;
    export let uploadedFileUrl = '';
    let errorMessage = '';
    //Se envian los datos al server en Flask
    const tratarCarga = async () => {
        if (!file) {
            return alert("Por favor, seleccione un archivo");
        }
        try {
            const result = await uploadFile(file);
            if (result.success) {
                uploadedFileUrl = result.file_url; // Asumiendo que el servidor devuelve la URL del archivo
            } else {
                errorMessage = result.message || 'Error desconocido';
            }
            console.log(uploadedFileUrl);
        } catch (error) {
            console.error('Error al cargar el archivo:', error);
        }
    }
    const tratarCambios = (e) => {
            file = e.target.files[0];
            errorMessage = '';
        }
</script>

<style>
    #file {
        margin-bottom: 1em;
    }
    .carga {
        margin: auto;
        width: 60%;
        text-align: center;
        padding-bottom: 2rem;
    }
</style>

<!-- Aqui se carga el archivo-->

<div class="carga">
    <label for="file">Seleccionar archivo: </label>
    <input type="file" id="file" on:change={tratarCambios} /><br>
    <button on:click={tratarCarga}>Subir archivo</button>
    {#if uploadedFileUrl}
    <p>Archivo subido correctamente. Visualizar 
        <a href = {uploadedFileUrl} target="_blank">aquí</a>
    </p>
    {/if}
    {#if errorMessage}
        <p style="color: red;">{errorMessage}</p>
    {/if}
</div>