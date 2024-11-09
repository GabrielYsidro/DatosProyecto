<script>
    import { uploadFile } from '../servicios/subirArchivo.js';
    
    let file = null;
    let uploadedFileUrl = '';

    //Se envian los datos al server en Flask
    const tratarCarga = async () => {
        if (!file) {
            return alert("Por favor, seleccione un archivo");
        }
        try {
            const result = await uploadFile(file);
            uploadedFileUrl = result.fileUrl; // Asumiendo que el servidor devuelve la URL del archivo
            console.log(uploadedFileUrl)
        } catch (error) {
            console.error('Error al cargar el archivo:', error);
        }
    }
    const tratarCambios = (e) => {
            file = e.target.files[0];
        }
</script>

<!-- Aqui se carga el archivo-->

<div>
    <label for="file">Seleccionar archivo: </label>
    <input type="file" id="file" on:change={tratarCambios} />
    <button on:click={tratarCarga}>Subir archivo</button>
    {#if uploadedFileUrl}
    <p>Archivo subido correctamente. Visualizar 
        <a href = {uploadedFileUrl} target="_blank">aquí</a>
    </p>
    {/if}
</div>