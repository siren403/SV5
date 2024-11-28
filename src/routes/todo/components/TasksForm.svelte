<script lang="ts">
    import Button from "$lib/components/ui/button/button.svelte";
    import Label from "$lib/components/ui/label/label.svelte";
    import Input from "$lib/components/ui/input/input.svelte";

    let newTask = $state("");
    let {
        addTask,
    }: {
        addTask: (newTask: string) => void;
    } = $props();

    function formSubmitted(
        e: SubmitEvent & { currentTarget: EventTarget & HTMLFormElement },
    ) {
        e.preventDefault();
        addTask(newTask);
        newTask = "";
    }
</script>

<form onsubmit={formSubmitted}>
    <Label>
        Task
        <Input class="my-2" name="newTask" bind:value={newTask} />
    </Label>
    <div class="flex justify-end">
        <Button>Add</Button>
    </div>
</form>
