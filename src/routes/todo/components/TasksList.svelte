<script lang="ts">
    import Button from "$lib/components/ui/button/button.svelte";
    import * as Card from "$lib/components/ui/card";
    import Checkbox from "$lib/components/ui/checkbox/checkbox.svelte";
    import Label from "$lib/components/ui/label/label.svelte";
    import type { Task } from "../types";

    const {
        tasks,
        toggleDone,
        removeTask,
    }: {
        tasks: Task[];
        toggleDone: (task: Task) => void;
        removeTask: (id: string) => void;
    } = $props();
</script>

<section>
    {#each tasks as task (task.id)}
        <Card.Root class="my-1">
            <Card.Content class="flex justify-between items-center">
                <span class:done={task.done}>
                    <Checkbox
                        id={task.id}
                        class="align-middle"
                        checked={task.done}
                        onCheckedChange={() => toggleDone(task)}
                    />
                    <Label for={task.id}>
                        {task.title}
                    </Label>
                </span>
                <Button
                    variant="destructive"
                    onclick={() => removeTask(task.id)}
                >
                    Remove
                </Button>
            </Card.Content>
        </Card.Root>
    {/each}
</section>

<style>
    .done {
        text-decoration: line-through;
    }
</style>
