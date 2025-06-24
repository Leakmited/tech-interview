<script lang="ts">
	import '../app.css';

	let { children } = $props();
</script>

<main class="flex min-h-screen flex-col bg-neutral-100">
	{@render children()}
</main>
