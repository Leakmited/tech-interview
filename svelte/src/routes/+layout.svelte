<script lang="ts">
	import '../app.css';

	let { children } = $props();
</script>

<main class="flex min-h-screen flex-col bg-slate-900 text-white">
	{@render children()}
</main>
