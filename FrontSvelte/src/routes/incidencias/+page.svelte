<script>
    let projects = ["Proyecto A", "Proyecto B", "Proyecto C"];
    let departments = ["Departamento X", "Departamento Y", "Departamento Z"];
    let selectedProject = "";
    let selectedDepartment = "";
    
    // Datos de ejemplo
    let incidents = [
      { id: '001', project: "Proyecto A", department: "Departamento X", title: 'Error en API', date: '2024-11-12', status: 'Abierto' },
      { id: '002', project: "Proyecto B", department: "Departamento Y", title: 'Falla en servidor', date: '2024-11-14', status: 'En progreso' },
      { id: '003', project: "Proyecto C", department: "Departamento Z", title: 'Configuración incorrecta', date: '2024-11-15', status: 'Cerrado' },
      { id: '004', project: "Proyecto A", department: "Departamento Y", title: 'Problema de acceso', date: '2024-11-16', status: 'Abierto' },
      { id: '005', project: "Proyecto B", department: "Departamento X", title: 'Actualización requerida', date: '2024-11-17', status: 'En progreso' }
    ];
  
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
          <option value={project}>{project}</option>
        {/each}
      </select>
    </div>
  
    <div>
      <label for="department-select">Departamento:</label>
      <select id="department-select" bind:value={selectedDepartment}>
        <option value="">Todos</option>
        {#each departments as department}
          <option value={department}>{department}</option>
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
  