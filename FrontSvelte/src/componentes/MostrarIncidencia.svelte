
<script>
    import { onMount } from 'svelte';
    import { page } from '$app/stores'; // Para acceder a los parámetros de la URL

    let id;
    let incidencia = '';

    // Obtener el ID de la URL
    $: id = $page.params.id;

    // Cargar la información de la incidencia (puedes usar fetch o Axios)
    onMount(async () => {
        const response = await fetch(`http://localhost:5000/api/incidencias/1`); // Endpoint de tu API
        if (response.ok) {
            incidencia = await response.json();
        } else {
            console.error("Error al obtener la incidencia");
        }
    });
</script>

<style>
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        font-family: Arial, sans-serif;
    }

    th, td {
        padding: 12px;
        border: 1px solid #ddd;
        text-align: left;
    }

    th {
        background-color: #338fcc;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f4f8fc;
    }

    tr:hover {
        background-color: #e9f1f7;
    }

    .loading {
        font-size: 1.2em;
        color: #888;
        text-align: center;
        margin-top: 20px;
    }
</style>

{#if incidencia}
    <table>
        <tbody>
            <tr>
                <th>ID</th>
                <td>{incidencia.id}</td>
            </tr>
            <tr>
                <th>Resumen</th>
                <td>{incidencia.resumen}</td>
            </tr>
            <tr>
                <th>Descripción</th>
                <td>{incidencia.descripcion}</td>
            </tr>
            <tr>
                <th>Fecha de Envío</th>
                <td>{incidencia.fecha_envio}</td>
            </tr>
            <tr>
                <th>Fecha de Actualización</th>
                <td>{incidencia.fecha_actu}</td>
            </tr>
            <tr>
                <th>ID del Proyecto</th>
                <td>{incidencia.id_proyecto}</td>
            </tr>
            <tr>
                <th>ID del Departamento</th>
                <td>{incidencia.id_departamento}</td>
            </tr>
            <tr>
                <th>ID del Estado</th>
                <td>{incidencia.id_estado}</td>
            </tr>
            <tr>
                <th>ID de la Prioridad</th>
                <td>{incidencia.id_prioridad}</td>
            </tr>
            <tr>
                <th>ID del Documento</th>
                <td>{incidencia.id_documento}</td>
            </tr>
        </tbody>
    </table>
{:else}
<div class="loading">
    <p>Cargando incidencia...</p>
</div>
    
{/if}