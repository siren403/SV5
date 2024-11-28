<svelte:options runes={true} />

<script lang="ts">
    import Button from "$lib/components/ui/button/button.svelte";
    import TasksForm from "./components/TasksForm.svelte";
    import TasksList from "./components/TasksList.svelte";
    import type { Filter, Task } from "./types";

    const message = "Tasks App";
    let currentFilter = $state<Filter>("todo");
    let tasks = $state<Task[]>([
        {
            id: crypto.randomUUID(),
            title: "Learn Svelte",
            done: false,
        },
        {
            id: crypto.randomUUID(),
            title: "Learn SvelteKit",
            done: false,
        },
        {
            id: crypto.randomUUID(),
            title: "Build a SvelteKit app",
            done: false,
        },
    ]);

    const totalDone = $derived(
        tasks.reduce((total, task) => total + Number(task.done), 0),
    );

    const filteredTasks = $derived.by(() => {
        switch (currentFilter) {
            case "all":
                return tasks;
            case "todo":
                return tasks.filter((task) => !task.done);
            case "done":
                return tasks.filter((task) => task.done);
            default:
                return tasks;
        }
    });

    $inspect(filteredTasks);

    function addTask(newTask: string) {
        tasks.push({
            id: crypto.randomUUID(),
            title: newTask,
            done: false,
        });
    }

    function toggleDone(task: Task) {
        task.done = !task.done;
    }

    function removeTask(id: string) {
        const index = tasks.findIndex((task) => task.id === id);
        tasks.splice(index, 1);
    }
</script>

{#snippet filteredButton(filter: Filter)}
    <Button
        onclick={() => (currentFilter = filter)}
        variant={currentFilter === filter ? "outline" : "secondary"}
        class="capitalize"
    >
        {filter}
    </Button>
{/snippet}

<main class="max-w-screen-md my-4">
    <h1 class="text-4xl font-bold">{message}</h1>
    <TasksForm {addTask} />
    <p>
        {#if tasks.length}
            {totalDone} / {tasks.length} tasks completed
        {:else}
            Add a task to get started
        {/if}
    </p>
    {#if tasks.length}
        <div class="my-2 flex justify-end gap-2">
            {@render filteredButton("all")}
            {@render filteredButton("todo")}
            {@render filteredButton("done")}
        </div>
    {/if}
    <TasksList tasks={filteredTasks} {toggleDone} {removeTask} />
</main>
