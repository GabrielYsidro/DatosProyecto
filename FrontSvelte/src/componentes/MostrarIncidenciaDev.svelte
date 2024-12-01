<script>
    import { onMount } from 'svelte';

    export let params;
    let incidencias = [];

    let devid = params?.devid || null;

    onMount(async () => {
    if (!devid) {
        console.error("ID de desarrollador no definido");
        return;
      }
  
      try {

        const response = await fetch(`http://localhost:5000/api/dev/${devid}`);
        if (response.ok) {
          incidencias = await response.json();
        } else {
          console.error("Error al obtener las incidencias");
        }
      } catch (error) {
        console.error("Error en la conexión:", error);
      }
    });
  </script>
  
  {#if incidencias.length > 0}
    <div>
      <h2>Incidencias del Desarrollador</h2>
      <table>
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
{/if}