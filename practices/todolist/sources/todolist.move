module todolist::todolist{

    use std::string::String;

    public struct TodoList has key, store {
        id: UID,
        tasks: vector<String>,
    }

    public fun new(ctx: &mut TxContext) {
        let list: TodoList = TodoList {
            id: object::new(ctx),
            tasks: vector[],
        };

        transfer::transfer(list, tx_context::sender(ctx));
    }

    public fun add_item(list: &mut TodoList, item: String){
    list.tasks.push_back(item);
    }

    public fun remove(list: &mut TodoList, index: u64){
        list.tasks.remove(index);
    }

    public fun delete(list: TodoList){
        let TodoList { id, tasks: _ } = list;
        id.delete();
    }


}
