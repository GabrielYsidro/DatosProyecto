<script>
  import MostrarIncidencia from '../../../componentes/MostrarIncidencia.svelte';
  import { page } from "$app/stores";

  let params;

  // Reactivo: extrae los parámetros desde la página
  $: params = $page.params;

  console.log("Params en +page.svelte:", params);
</script>

<MostrarIncidencia {params} />