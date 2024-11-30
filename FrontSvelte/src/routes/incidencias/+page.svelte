<script>
  import { onMount } from 'svelte';
  import { fetchRecurso } from '../../servicios/buscarRecurso'

  let projects = [];
  let departments = [];
  let selectedProject = "";
  let selectedDepartment = "";

  // Llamar a la API para obtener proyectos y departamentos
  onMount(async () => {
    projects = await fetchRecurso('proyectos');
    departments = await fetchRecurso('departamentos');
  });
</script>

<!-- Tu HTML -->
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
  