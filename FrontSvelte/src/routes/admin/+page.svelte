<script>
  export let title;
  
  // Datos de ejemplo con ID, título, fecha y estado.
  let incidents = [
    { id: '0034949', title: 'Max attachment size should scale to larger units in user interface', date: '2024-11-13 07:25', status: 'Abierto' },
    { id: '0034444', title: 'User group management', date: '2024-11-16 10:00', status: 'En progreso' },
    { id: '0034578', title: 'API access configuration', date: '2024-11-08 14:19', status: 'Cerrado' },
    { id: '0034998', title: 'Update HTML purifier', date: '2024-11-05 04:15', status: 'Abierto' },
    { id: '0034928', title: 'Non-US date format error', date: '2024-11-10 11:58', status: 'En progreso' },
  ];

  // Controla la visibilidad de la lista de incidentes
  let isTableVisible_noasignadas = true;
  let isTableVisible2_resueltas = true;
  let isTableVisible3_modificadas = true;

  // Cambia la visibilidad de la tabla
  function toggleTable(table) {
    if (table === 'noasignadas') {
      isTableVisible_noasignadas = !isTableVisible_noasignadas;
    } else if (table === 'resueltas') {
      isTableVisible2_resueltas = !isTableVisible2_resueltas;
    } else if (table === 'modificadas') {
      isTableVisible3_modificadas = !isTableVisible3_modificadas;
    }
  }

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

<div class="banner">
  <div class="banner-left">
    <h1>Mantis</h1>
  </div>
  <div class="banner-right">
    <span>Anonymus</span>
  </div>
</div>

<div class="no-asignadas">
  <div class="incident-table">
    <div class="table-header">
      <h2>No asignadas</h2>
      <h2 id="header-counter">{title} <span>1 -5 / {incidents.length}</span></h2>
      <button on:click={() => toggleTable('noasignadas')} class="toggle-button">
        {#if isTableVisible_noasignadas}
          V <!-- Flecha hacia abajo -->
        {:else}
          ^ <!-- Flecha hacia la derecha -->
        {/if}
      </button>
    </div>

    {#if isTableVisible_noasignadas}
      <div class="incident-list">
        {#each incidents as incident}
          <div class="incident-row">
            <div class="id-section">
              <span class="status-indicator" style="background-color: {getStatusColor(incident.status)};"></span>
              <span class="incident-id">{incident.id}</span>
            </div>
            <div class="details-section">
              <span class="title">{incident.title}</span>
              <span class="date">{incident.date}</span>
            </div>
          </div>
        {/each}
      </div>
    {/if}
  </div>
</div>

<div class="resueltas">
  <div class="incident-table">
    <div class="table-header">
      <h2>Resueltas</h2>
      <h2 id="header-counter">{title} <span>1 -5 / {incidents.length}</span></h2>
      <button on:click={() => toggleTable('resueltas')} class="toggle-button">
        {#if isTableVisible2_resueltas}
          V <!-- Flecha hacia abajo -->
        {:else}
          ^ <!-- Flecha hacia la derecha -->
        {/if}
      </button>
    </div>

    {#if isTableVisible2_resueltas}
      <div class="incident-list">
        {#each incidents as incident}
          <div class="incident-row">
            <div class="id-section">
              <span class="status-indicator" style="background-color: {getStatusColor(incident.status)};"></span>
              <span class="incident-id">{incident.id}</span>
            </div>
            <div class="details-section">
              <span class="title">{incident.title}</span>
              <span class="date">{incident.date}</span>
            </div>
          </div>
        {/each}
      </div>
    {/if}
  </div>
</div>

<div class="modificadas">
  <div class="incident-table">
    <div class="table-header">
      <h2>Modificadas últimamente (30 días)</h2>
      <h2 id="header-counter">{title} <span>1 -5 / {incidents.length}</span></h2>
      <button on:click={() => toggleTable('modificadas')} class="toggle-button">
        {#if isTableVisible3_modificadas}
          V <!-- Flecha hacia abajo -->
        {:else}
          ^ <!-- Flecha hacia la derecha -->
        {/if}
      </button>
    </div>

    {#if isTableVisible3_modificadas}
      <div class="incident-list">
        {#each incidents as incident}
          <div class="incident-row">
            <div class="id-section">
              <span class="status-indicator" style="background-color: {getStatusColor(incident.status)};"></span>
              <span class="incident-id">{incident.id}</span>
            </div>
            <div class="details-section">
              <span class="title">{incident.title}</span>
              <span class="date">{incident.date}</span>
            </div>
          </div>
        {/each}
      </div>
    {/if}
  </div>
</div>

<!-- Botón "Ver incidencias" al final de la página -->
<div class="ver-incidencias-btn">
  <a href="/incidencias">
    <button>Ver incidencias</button>
  </a>
</div>

<style>
  .banner {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #666;
    color: white;
    padding: 10px 20px;
    font-family: Arial, sans-serif;
  }

  .banner-left h1 {
    margin: 0;
    font-size: 24px;
  }

  .banner-right span {
    font-size: 18px;
  }

  .incident-table {
    background-color: #d9e9f7;
    border-radius: 8px;
    margin: 10px auto;
    padding: 10px;
    width: 100%;
    max-width: 800px;
  }

  .table-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
    background-color: #338fcc;
    padding: 10px;
    border-radius: 8px 8px 0 0;
    color: white;
  }

  .table-header h2 {
    font-size: 18px;
    margin: 0;
  }

  .table-header span {
    background-color: #a1b5c6;
    padding: 3px 6px;
    border-radius: 12px;
    font-size: 12px;
    color: white;
  }

  #header-counter {
    margin-right: auto;
    font-size: 18px;
    margin-left: 10px;
    color: white;
  }

  .table-header button {
    background-color: #ffeb3b;
    color: #333;
    border: none;
    padding: 6px 12px;
    cursor: pointer;
    border-radius: 4px;
    font-weight: bold;
    margin-right: 10px;
  }

  .incident-list {
    padding: 10px;
    background-color: #f4f8fc;
    border-radius: 0 0 8px 8px;
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

  .incident-id {
    font-size: 16px;
    font-weight: bold;
    color: #338fcc;
  }

  .details-section {
    display: flex;
    flex-direction: column;
  }

  .title {
    font-size: 14px;
    font-weight: bold;
  }

  .date {
    font-size: 12px;
    color: #888;
  }

  .ver-incidencias-btn {
    text-align: center;
    margin-top: 20px;
  }

  .ver-incidencias-btn button {
    background-color: #338fcc;
    color: white;
    border: none;
    padding: 8px 16px;
    cursor: pointer;
    border-radius: 4px;
    font-weight: bold;
    font-size: 14px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: background-color 0.3s ease;
  }

  .ver-incidencias-btn button:hover {
    background-color: #2874b1;
  }
</style>
