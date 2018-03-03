defmodule TodoList do
  # todo crud - hierachical data

  # our struct
  defstruct auto_id: 1, entries: %{}

  # init empty TodoList
  # def new, do: %TodoList{}
  def new(entries \\ []) do
    Enum.reduce(
      entries,
      %TodoList{},
      fn(entry, todo_list_acc) ->
        add_entry(todo_list_acc, entry)
      end
    )
  end

  # add entry to our TodoList
  def add_entry(%TodoList{entries: entries, auto_id: auto_id} = todo_list, entry) do
    entry = Map.put(entry, :id, auto_id)
    new_entries = Map.put(entries, auto_id, entry)
    %TodoList{todo_list |
      entries: new_entries,
      auto_id: auto_id + 1
    }
  end

  # show entries for specific date
  def entries(%TodoList{entries: entries}, date) do
    entries
    |> Stream.filter(fn({_, entry}) -> entry.date == date end)
    |> Enum.map(fn({_, entry}) -> entry end)
  end

  # update entry 
  def update_entry(todo_list, %{} = new_entry) do
    update_entry(todo_list, new_entry.id, fn(_) -> new_entry end)
  end

  # update entry with specific ID
  def update_entry(%TodoList{entries: entries} = todo_list, entry_id, updater_fun) do
    case entries[entry_id] do    
      nil -> todo_list

      old_entry ->
        new_entry = updater_fun.(old_entry)
        new_entries = Map.put(entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end

  # delete entry from our TodoList
  def delete_entry(%TodoList{entries: entries} = todo_list, entry_id) do
    %TodoList{todo_list | entries: Map.delete(entries, entry_id)}
  end

end