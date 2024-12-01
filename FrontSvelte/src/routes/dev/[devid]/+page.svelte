<script>
  import { onMount } from 'svelte';
  import { page } from '$app/stores';  // Para capturar el parámetro 'devid' desde la URL

  let incidencias = [];
  let devid = $page.params.devid;  // Capturamos el 'devid' de la URL

  // Al montar el componente, hacemos la petición al backend
  onMount(async () => {
    if (!devid) {
      console.error("ID de desarrollador no proporcionado");
      return;
    }

    try {
      const response = await fetch(`http://localhost:5000/api/dev/${devid}`);
      if (response.ok) {
        incidencias = await response.json();  // Guardamos las incidencias en el array
      } else {
        console.error("Error al obtener las incidencias");
      }
    } catch (error) {
      console.error("Error en la conexión:", error);
    }
  });
</script>

{#if incidencias.length > 0}
  <div class="incidencias-container">
    <h2>Incidencias del Desarrollador {devid}</h2>
    <table class="incidencias-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Resumen</th>
          <th>Descripción</th>
          <th>Fecha de Envío</th>
          <th>Fecha de Actualización</th>
        </tr>
      </thead>
      <tbody>
        {#each incidencias as incidencia}
          <tr>
            <td>{incidencia.id}</td>
            <td>{incidencia.resumen}</td>
            <td>{incidencia.descripcion}</td>
            <td>{incidencia.fecha_envio}</td>
            <td>{incidencia.fecha_actu}</td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
{:else}
  <p>No se encontraron incidencias para este desarrollador.</p>
{/if}

<style>
  .incidencias-container {
    width: 90%;
    max-width: 1200px;
    margin: 20px auto;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
  }

  h2 {
    text-align: center;
    color: #338fcc;
    margin-bottom: 20px;
  }

  .incidencias-table {
    width: 100%;
    border-collapse: collapse;
    background-color: #ffffff;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
  }

  th, td {
    padding: 12px;
    text-align: left;
    border: 1px solid #ddd;
  }

  th {
    background-color: #338fcc;
    color: white;
  }

  tr:nth-child(even) {
    background-color: #f9f9f9;
  }

  tr:hover {
    background-color: #e9f1f7;
  }
</style>