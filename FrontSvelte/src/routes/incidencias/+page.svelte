<script>
  import { onMount } from 'svelte';

  let projects = [];
  let departments = [];
  let incidents = [];
  let selectedProject = "";
  let selectedDepartment = "";

    // Función genérica para obtener datos
    async function fetchData(resource) {
    const response = await fetch(`http://localhost:5000/api/${resource}`);
    return await response.json();
    }

  // Función para obtener recursos desde la API
  async function fetchRecurso(recurso) {
    const response = await fetch(`http://localhost:5000/api/${recurso}`);
    return response.ok ? response.json() : [];
  }

  // Función para obtener incidencias filtradas desde la API
  async function fetchIncidencias() {
    const url = new URL('http://localhost:5000/api/incidencias');
    if (selectedProject) url.searchParams.append('id_proyecto', selectedProject);
    if (selectedDepartment) url.searchParams.append('id_departamento', selectedDepartment);

    const response = await fetch(url);
    incidents = response.ok ? await response.json() : [];
  }

  // Llamar a la API para obtener proyectos, departamentos e incidencias al inicio
  onMount(async () => {
    projects = await fetchRecurso('proyectos');
    departments = await fetchRecurso('departamentos');
    await fetchIncidencias();
  });

  // Actualizar las incidencias cada vez que cambien los filtros
  $: if (selectedProject || selectedDepartment) {
    fetchIncidencias();
  }
</script>



<!-- Tu HTML -->
<!-- Filtros -->
<div class="filter-container">
  <!-- Filtro de Proyectos -->
  <div>
    <label for="project-select">Proyecto:</label>
    <select id="project-select" bind:value={selectedProject}>
      <option value="">Todos</option>
      {#each projects as project}
        <option value={project.id}>{project.nombre}</option>
      {/each}
    </select>
  </div>

  <!-- Filtro de Departamentos -->
  <div>
    <label for="department-select">Departamento:</label>
    <select id="department-select" bind:value={selectedDepartment}>
      <option value="">Todos</option>
      {#each departments as department}
        <option value={department.id}>{department.nombre}</option>
      {/each}
    </select>
  </div>
</div>

<!-- Tabla de Incidencias -->
<div class="incident-table">
  <h2>Incidencias</h2>
  {#if incidents.length > 0}
    <div class="incident-list">
      {#each incidents as incident}
        <div class="incident-row">
          <div class="id-section">
            <span class="incident-id">{incident.id}</span>
          </div>
          <div class="details-section">
            <a href="/incidencias/{incident.id}">{incident.resumen}</a>
            <span class="project">Proyecto: {incident.proyecto}</span>
            <span class="department">Departamento: {incident.departamento}</span>
            <span class="date">{incident.fecha_envio}</span>
          </div>
        </div>
      {/each}
    </div>
  {:else}
    <p>No se encontraron incidencias para los filtros seleccionados.</p>
  {/if}
</div>


<style>
  .filter-container {
    display: flex;
    justify-content: space-around;
    margin: 20px;
    font-family: Arial, sans-serif;
  }

  label {
    font-weight: bold;
    margin-right: 10px;
  }

  select {
    padding: 5px;
    border-radius: 4px;
    border: 1px solid #ccc;
  }

  .incident-table {
    margin: 20px auto;
    width: 80%;
    max-width: 800px;
    border-radius: 8px;
    background-color: #f4f8fc;
    padding: 10px;
  }

  .incident-list {
    margin-top: 10px;
  }

  .incident-row {
    display: flex;
    align-items: center;
    padding: 10px;
    border-bottom: 1px solid #c3d3e5;
  }

  .id-section {
    display: flex;
    align-items: center;
    margin-right: 15px;
  }

  .details-section {
    display: flex;
    flex-direction: column;
  }

  .details-section span {
    margin-top: 2px;
  }
</style>