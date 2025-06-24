<script lang="ts">
	import { onMount } from 'svelte';
	let counter1 = 0;
	let counter2 = 0;
	let total = counter1 + counter2;
	let isEven = total % 2 === 0;

	$effect(() => {
		console.log('Total changed:', total);
	});

	function incrementCounter1() {
		counter1++;
	}

	function incrementCounter2() {
		counter2++;
	}

	function resetCounters() {
		counter1 = 0;
		counter2 = 0;
	}

	onMount(() => {
		console.log('Component mounted');
	});
</script>

<div class="container mx-auto px-4 py-8">
	<h1 class="mb-8 text-center text-4xl font-bold">Reactivity Challenge</h1>

	<div class="mx-auto max-w-2xl rounded-lg bg-white p-8 shadow-lg">
		<div class="mb-6">
			<h2 class="mb-4 text-2xl font-semibold">Problem Description</h2>
			<p class="mb-4 text-gray-700">
				This code has several reactivity issues. Your task is to fix them so that:
			</p>
			<ul class="ml-4 list-inside list-disc space-y-2 text-gray-700">
				<li>The total updates automatically when either counter changes</li>
				<li>The "isEven" status updates reactively</li>
				<li>The console.log statement triggers when total changes</li>
				<li>All values display correctly in the UI</li>
			</ul>
		</div>

		<div class="mb-6 grid grid-cols-1 gap-6 md:grid-cols-2">
			<div class="rounded-lg bg-blue-50 p-4">
				<h3 class="mb-2 text-lg font-semibold">Counter 1</h3>
				<p class="mb-2 text-3xl font-bold text-blue-600">{counter1}</p>
				<button
					onclick={incrementCounter1}
					class="rounded bg-blue-500 px-4 py-2 text-white hover:bg-blue-600"
				>
					Increment
				</button>
			</div>

			<div class="rounded-lg bg-green-50 p-4">
				<h3 class="mb-2 text-lg font-semibold">Counter 2</h3>
				<p class="mb-2 text-3xl font-bold text-green-600">{counter2}</p>
				<button
					onclick={incrementCounter2}
					class="rounded bg-green-500 px-4 py-2 text-white hover:bg-green-600"
				>
					Increment
				</button>
			</div>
		</div>

		<div class="mb-6 rounded-lg bg-gray-50 p-4">
			<h3 class="mb-2 text-lg font-semibold">Derived Values</h3>
			<div class="grid grid-cols-2 gap-4">
				<div>
					<p class="text-sm text-gray-600">Total:</p>
					<p class="text-2xl font-bold {total > 10 ? 'text-red-600' : 'text-gray-800'}">{total}</p>
				</div>
				<div>
					<p class="text-sm text-gray-600">Is Even?</p>
					<p class="text-2xl font-bold {isEven ? 'text-green-600' : 'text-orange-600'}">
						{isEven ? 'Yes' : 'No'}
					</p>
				</div>
			</div>
		</div>

		<div class="text-center">
			<button
				onclick={resetCounters}
				class="rounded bg-red-500 px-6 py-2 text-white hover:bg-red-600"
			>
				Reset All Counters
			</button>
		</div>
	</div>
</div>
