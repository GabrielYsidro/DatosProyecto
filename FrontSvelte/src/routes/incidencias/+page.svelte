<script>
  import { onMount } from 'svelte';
   import { onMount } from 'svelte';

  let projects = [];
  let departments = [];
  let incidents = [];
  let selectedProject = "";
  let selectedDepartment = "";
    let projects = [];
    let departments = [];
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
            <a href="/incidencias/{incident.id}"><span class="title">{incident.resumen}</span></a>
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

    // Llamar a la API para obtener proyectos y departamentos
    onMount(async () => {
    projects = await fetchData('proyectos');
    departments = await fetchData('departamentos');
    });
  
    // Filtra las incidencias según los valores seleccionados
    $: filteredIncidents = incidents.filter(incident => {
      return (
        (selectedProject ? incident.project === selectedProject : true) &&
        (selectedDepartment ? incident.department === selectedDepartment : true)
      );
    });
  
    // Función para obtener el color del estado
    function getStatusColor(status) {
      switch (status) {
        case 'Abierto': return '#e57e7e';
        case 'En progreso': return '#f1c40f';
        case 'Cerrado': return '#81c784';
        default: return '#c3c3c3';
      }
    }
  </script>
  
  <div class="filter-container">
    <div>
      <label for="project-select">Proyecto:</label>
      <select id="project-select" bind:value={selectedProject}>
        <option value="">Todos</option>
        {#each projects as project}
          <option value={project.id}>{project.nombre}</option>
        {/each}
      </select>
    </div>
  
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
  
  <div class="incident-table">
    <h2>Incidencias</h2>
    {#if filteredIncidents.length > 0}
      <div class="incident-list">
        {#each filteredIncidents as incident}
          <div class="incident-row">
            <div class="id-section">
              <span class="status-indicator" style="background-color: {getStatusColor(incident.status)};"></span>
              <span class="incident-id">{incident.id}</span>
            </div>
            <div class="details-section">
              <span class="title">{incident.title}</span>
              <span class="project">Proyecto: {incident.project}</span>
              <span class="department">Departamento: {incident.department}</span>
              <span class="date">{incident.date}</span>
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
  
    .status-indicator {
      width: 12px;
      height: 12px;
      border-radius: 50%;
      margin-right: 8px;
    }
  
    .details-section {
      display: flex;
      flex-direction: column;
    }
  
    .details-section span {
      margin-top: 2px;
    }
  </style>
  