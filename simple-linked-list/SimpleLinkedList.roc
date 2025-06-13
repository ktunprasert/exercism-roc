module [from_list, to_list, push, pop, reverse, len]

SimpleLinkedList : [None, Node { value : U64, next : SimpleLinkedList }]

from_list : List U64 -> SimpleLinkedList
from_list = |list| list |> List.walk(None, |node, n| push(node, n))

expect from_list([1, 2]) == Node({ value: 1, next: Node({ value: 2, next: None }) })

to_list : SimpleLinkedList -> List U64
to_list = |linked_list|
    helper = |node, acc|
        when node is
            None -> acc
            Node({ value, next }) -> helper(next, List.append(acc, value))

    helper(linked_list, [])

expect to_list(from_list([1, 2, 3])) == [1, 2, 3]

push : SimpleLinkedList, U64 -> SimpleLinkedList
push = |linked_list, item|
    helper = |head|
        when head is
            None -> Node({ value: item, next: None })
            Node({ value, next }) -> Node({ value: value, next: helper(next) })

    helper(linked_list)

expect push(None, 1) == Node({ value: 1, next: None })

pop : SimpleLinkedList -> Result { value : U64, linked_list : SimpleLinkedList } _
pop = |linked_list|
    when linked_list is
        None -> Err(Empty)
        Node({ value, next }) if next == None -> Ok({ value: value, linked_list: None })
        Node({ value, next }) ->
            Result.map_ok(
                pop(next),
                |n| { value: n.value, linked_list: Node({ value: value, next: n.linked_list }) },
            )

expect [1] |> from_list |> pop == Ok({ value: 1, linked_list: None })
expect [1, 2] |> from_list |> pop == Ok({ value: 2, linked_list: Node({ value: 1, next: None }) })
expect None |> pop == Err(Empty)

reverse : SimpleLinkedList -> SimpleLinkedList
reverse = |linked_list|
    linked_list |> to_list |> List.reverse |> from_list

expect reverse(from_list([1, 2, 3])) == from_list([3, 2, 1])

len : SimpleLinkedList -> U64
len = |linked_list|
    helper = |node, acc|
        when node is
            None -> acc
            Node({ next }) -> helper(next, (acc + 1))
    helper(linked_list, 0)

expect [1] |> from_list |> len == 1
