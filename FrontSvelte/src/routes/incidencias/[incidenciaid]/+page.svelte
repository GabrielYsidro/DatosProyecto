<script>
    import { onMount } from 'svelte';
    import { page } from '$app/stores'; // Para acceder a los parámetros de la URL

    let id;
    let incidencia;

    // Obtener el ID de la URL
    $: id = $page.params.id;

    // Cargar la información de la incidencia (puedes usar fetch o Axios)
    onMount(async () => {
        const response = await fetch(`/api/incidencias/${id}`); // Endpoint de tu API
        if (response.ok) {
            incidencia = await response.json();
        } else {
            console.error("Error al obtener la incidencia");
        }
    });
</script>

{#if incidencia}
    <h1>Incidencia #{id}</h1>
    <p><strong>Título:</strong> {incidencia.nombre}</p>
    <p><strong>Descripción:</strong> {incidencia.resumen}</p>
    <p><strong>Estado:</strong> {incidencia.descripcion}</p>
    <!-- Renderiza más información aquí -->
{:else}
    <p>Cargando r...</p>
{/if}
