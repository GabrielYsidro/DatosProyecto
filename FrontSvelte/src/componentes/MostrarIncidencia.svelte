<script>
    import { onMount } from "svelte";

    export let params;
    let id = params?.incidenciaid || null;
    let incidencia = null;
    let proyectos = [];
    let departamentos = [];
    let estados = [];
    let prioridades = [];
    let etiquetas = [];
    let etiquetasSeleccionadas = [];

    let loading = false;

    const fetchData = async (url) => {
        const response = await fetch(url);
        if (response.ok) {
            return await response.json();
        } else {
            console.error(`Error al obtener datos de ${url}`);
            return [];
        }
    };

    onMount(async () => {
        if (!id) {
            console.error("ID no definido");
            return;
        }

        try {
            const urls = [
                `http://localhost:5000/api/incidencias/${id}`,
                "http://localhost:5000/api/proyectos",
                "http://localhost:5000/api/departamentos",
                "http://localhost:5000/api/estados",
                "http://localhost:5000/api/prioridades",
                "http://localhost:5000/api/etiquetas"
            ];
            const [incidenciaData, proyectosData, departamentosData, estadosData, prioridadesData, etiquetasData] =
                await Promise.all(urls.map(fetchData));

            incidencia = incidenciaData || {}; // Asegúrate de que no sea null/undefined
            proyectos = proyectosData;
            departamentos = departamentosData;
            estados = estadosData;
            prioridades = prioridadesData;
            etiquetas = etiquetasData;

            // Inicializa etiquetasSeleccionadas con los IDs correspondientes
            etiquetasSeleccionadas = (incidencia.tags || []).map(tag =>
                etiquetas.find(e => e.nombre === tag)?.id
            ).filter(Boolean);
        } catch (error) {
            console.error("Error al cargar datos:", error);
        }
    });

    const actualizarIncidencia = async () => {
        try {
            const body = {
                id_proyecto: incidencia.id_proyecto,
                id_departamento: incidencia.id_departamento,
                id_estado: incidencia.id_estado,
                id_prioridad: incidencia.id_prioridad,
                tags: etiquetasSeleccionadas,
            };

            const respuesta = await fetch(`http://localhost:5000/api/incidencias/${id}`, {
                method: "PUT",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body),
            });

            if (!respuesta.ok) {
                throw new Error(`Error: ${respuesta.status}`);
            }

            alert("Incidencia actualizada correctamente.");
        } catch (error) {
            console.error("Error al actualizar la incidencia:", error);
            alert("Error al actualizar la incidencia.");
        }
    };

    // Función para manejar la selección de etiquetas
    const toggleEtiqueta = (idEtiqueta) => {
        if (etiquetasSeleccionadas.includes(idEtiqueta)) {
            etiquetasSeleccionadas = etiquetasSeleccionadas.filter(id => id !== idEtiqueta);
        } else {
            etiquetasSeleccionadas = [...etiquetasSeleccionadas, idEtiqueta];
        }
    };
</script>
  
  
{#if incidencia}
    <div>
        <h1>Editar Incidencia</h1>
        <h2>{incidencia.resumen}</h2>
        <p>{incidencia.descripcion}</p>

        <table>
            <tbody>
                <tr>
                    <th>Proyecto</th>
                    <td>
                        <select bind:value={incidencia.id_proyecto}>
                            {#each proyectos as proyecto}
                                <option value={proyecto.id}>{proyecto.nombre}</option>
                            {/each}
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Departamento</th>
                    <td>
                        <select bind:value={incidencia.id_departamento}>
                            {#each departamentos as depto}
                                <option value={depto.id}>{depto.nombre}</option>
                            {/each}
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Estado</th>
                    <td>
                        <select bind:value={incidencia.id_estado}>
                            {#each estados as estado}
                                <option value={estado.id}>{estado.nombre}</option>
                            {/each}
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Prioridad</th>
                    <td>
                        <select bind:value={incidencia.id_prioridad}>
                            {#each prioridades as prioridad}
                                <option value={prioridad.id}>{prioridad.nombre}</option>
                            {/each}
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Etiquetas</th>
                    <td>
                        <div>
                            {#each etiquetas as etiqueta}
                                <label>
                                    <input
                                        type="checkbox"
                                        value={etiqueta.id}
                                        on:change={() => toggleEtiqueta(etiqueta.id)}
                                        checked={etiquetasSeleccionadas.includes(etiqueta.id)}
                                    />
                                    {etiqueta.nombre}
                                </label>
                            {/each}
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <button on:click={actualizarIncidencia}>Actualizar</button>
    </div>
{:else}
    <p>Cargando incidencia...</p>
{/if}
  
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

</style>