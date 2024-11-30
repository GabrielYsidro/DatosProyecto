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

  let isTimelineVisible = true;

  const timelineEvents = [
  {
    userImage: '',
    userName: "dregad",
    action: "realizó un comentario en la incidencia",
    issueId: "0034928",
    date: "2024-11-10 11:58",
  },
  {
    userImage: '',
    userName: "atrol",
    action: "se asignó la incidencia",
    issueId: "0008355",
    date: "2024-11-10 07:43",
  },
  // Agrega más eventos según sea necesario
  ];


    // Controla la visibilidad de la lista de incidentes
  let isTableVisible = true;

 // Cambia la visibilidad de la tabla
  function toggleTable() {
    isTableVisible=!isTableVisible;
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
  <div class="container">
    
    <div class="no-asignadas">
      <div class="incident-table">
        <div class="table-header">
          <h2>Asignaciones</h2>
          <h2 id="header-counter">{title} <span>1 -5 / {incidents.length}</span></h2>
          <button>Ver incidencias</button>
          <button on:click={toggleTable} class="toggle-button">
            {#if isTableVisible}
              V <!-- Flecha hacia abajo -->
            {:else}
              ^ <!-- Flecha hacia la derecha -->
            {/if}
          </button>

        </div>
        
        {#if isTableVisible}
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
    
    <div class="timeline">
      <div class="timeline-header">
        <h2>Línea de tiempo</h2>
        <button class="toggle-button" on:click={() => isTimelineVisible = !isTimelineVisible}>
          {#if isTimelineVisible}
            ^ <!-- Flecha hacia arriba -->
          {:else}
            V <!-- Flecha hacia abajo -->
          {/if}
        </button>
      </div>
      
      {#if isTimelineVisible}
        <div class="timeline-content">
          {#each timelineEvents as event}
            <div class="timeline-event">
              <img src="{event.userImage}" alt="{event.userName}" class="user-avatar" />
              <div class="event-details">
                <span class="user-name">{event.userName}</span>
                <span class="event-action">{event.action}</span>
                <span class="event-link">{event.issueId}</span>
                <span class="event-date">{event.date}</span>
              </div>
            </div>
          {/each}
        </div>
      {/if}
    </div>    
  </div>


  <style>

    .container {
      display: flex;
      flex-wrap: nowrap;
      gap: 20px;
      justify-content: space-around;
      width: 100%;
      max-width: 1280px;
    
    }
    .banner {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color:#666;
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
    max-width: 800px; /* Tamaño máximo fijo en pantallas grandes */
    }
  
    .table-header {
      display: flex;
      justify-content:space-between;
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
    
    #header-counter{
        margin-right: auto; /* Empuja el botón hacia la derecha */
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
      border-radius: 4px;
      margin-right: 8px;
    }
  
    .incident-id {
      font-weight: bold;
      color: #333;
    }
  
    .details-section {
      display: flex;
      flex-direction: column;
    }
  
    .title {
      color: #338fcc;
      font-weight: bold;
    }
  
    .date {
      font-size: 12px;
      color: #666;
    }

    /*LINEA DE  TIEMPO*/
        .timeline {
      background-color: #e3ecf7;
      border: 1px solid #2a70b8;
      border-radius: 5px;
      padding: 10px;
      margin-top: 15px;
      flex: 1;
      max-width: 300px;
    }

  .timeline-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 5px;
    background-color: #2a70b8;
    color: #ffffff;
    font-weight: bold;
    border-radius: 3px 3px 0 0;
  }

  .timeline-content {
    padding: 10px;
  }

  .timeline-event {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
    padding: 5px;
    background-color: #ffffff;
    border-radius: 3px;
  }

  .user-avatar {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    margin-right: 10px;
  }

  .event-details {
    display: flex;
    flex-direction: column;
  }

  .user-name {
    font-weight: bold;
    color: #2a70b8;
  }

  .event-action {
    color: #555;
  }

  .event-link {
    color: #2a70b8;
    text-decoration: underline;
    cursor: pointer;
  }

  .event-date {
    font-size: 0.8em;
    color: #888;
  }

/* Media query para pantallas pequeñas */
@media (max-width: 768px) {
    .incident-table {
        width: 90%; /* Se adapta al ancho completo de la pantalla */
        max-width: none; /* Quita la restricción de tamaño fijo */
    }

    .container {
    flex-direction: column;
  }

  .timeline {
    max-width: none;
    margin-top: 20px; /* Separación entre las tablas y la línea de tiempo */
  }
}
  </style>
  