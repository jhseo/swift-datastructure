import UIKit

class Node {
    let value: String // Node의 값
    var next: Node? // 다음 Node의 주소를 가진 변수

    init(value: String, next: Node?) {
        self.value = value
        self.next = next
    }
}

class LinkedList {
    var head: Node?

    // 마지막 node에 더한다.
    func add(value: String) {
        // head가 없으면 head에 넣는다
        if head == nil {
            head = Node(value: value, next: nil)
            return
        }

        // head가 있으면 마지막 node까지 이동
        var current = head
        while current?.next != nil {
            current = current?.next
        }

        // 마지막 node에 새로운 node를 연결
        current?.next = Node(value: value, next: nil)
    }

    // 값을 찾아 node를 삭제한다.
    func delete(value: String) {
        // 지우려는 value가 head의 value와 같으면 head의 next가 head가 된다.
        if head?.value == value {
            head = head?.next
            return
        }

        // 현재 value와 같은 node를 찾는다.
        var before = head
        var current = head
        while current != nil && current?.value != value {
            before = current
            current = current?.next
        }
        // 이전 node의 next값을 현재 node의 next으로 가리킨다.
        before?.next = current?.next
    }

    // index에 있는 node를 삭제한다.
    func delete(index: Int) {
        // index가 0이면 head의 next가 head가 된다.
        if index == 0 {
            head = head?.next
            return
        }
        // 지우려는 value가 head의 value와 같으면
        var before = head
        var current = head
        var currentIndex = 0

        // 현재 index와 찾고자하는 index가 동일한 node를 찾는다.
        while current != nil && currentIndex != index {
            before = current
            current = current?.next
            currentIndex = currentIndex + 1
        }
        before?.next = current?.next
    }

    // 넣으려는 value가 index 위치로 저장되어야 한다.
    func insert(value: String, index: Int) {
        // head가 없으면 head에 넣는다
        if head == nil {
            head = Node(value: value, next: nil)
            return
        }
        // 첫번째 index이면 head 앞에 insert
        if index == 0 {
            head = Node(value: value, next: head)
            return
        }

        // 현재 index와 같은 node를 찾는다.
        var before = head
        var current = head
        var currentIndex = 0
        while current != nil && currentIndex != index {
            before = current
            current = current?.next
            currentIndex = currentIndex + 1
        }

        // 현재 node를 next로 가리키는 node를 생성하고 이전 node의 next와 연결한다.
        if currentIndex == index {
            before?.next = Node(value: value, next: current)
        }
    }

    // index로 검색
    func search(index: Int) -> String? {
        var current = head
        var currentIndex = 0

        // 현재 index와 찾고자하는 index가 동일한 node를 찾는다.
        while current != nil && currentIndex != index {
            current = current?.next
            currentIndex = currentIndex + 1
        }
        return current?.value
    }

    // value로 검색
    func search(value: String) -> Int? {
        var current = head
        var currentIndex = 0

        // 현재 value와 찾고자하는 value가 동일한 node를 찾는다.
        while(current != nil && current?.value != value) {
            current = current?.next
            currentIndex = currentIndex + 1
        }
        // 현재 node가 nil이면 값이 없으므로 nil을 return하고 값이 있으면 currentIndex를 return한다.
        return current == nil ? nil : currentIndex
    }

    // 모든 node를 출력한다.
    func showNodes() {
        var current = head
        while current != nil {
            print(current?.value ?? "")
            current = current?.next
        }
    }
}


let linkedList = LinkedList()

print("----- Add Test -----")
linkedList.add(value: "1")
linkedList.add(value: "2")
linkedList.add(value: "3")
linkedList.showNodes() // "1", "2", "3"
print("\n\n")

print("----- Insert Test -----")
linkedList.insert(value: "test5", index: 5) // insert 되지 않음
linkedList.insert(value: "test2", index: 2) // 마지막에 insert
linkedList.insert(value: "test3", index: 4) // 마지막에 insert
linkedList.insert(value: "test0", index: 0) // 처음에 insert
linkedList.insert(value: "0", index: 0) // 처음에 insert
linkedList.insert(value: "4", index: 7) // 처음에 insert

linkedList.showNodes() // "0", "test0", "1", "2", "test2", "3", "test3", "4"
print("\n\n")


print("----- Search Test -----")
let index1 = linkedList.search(value: "test2")
print("value: test2, index: \(index1)") // Optional("4")
let index2 = linkedList.search(value: "head")
print("value: head, index: \(index2)") // nil
let value1 = linkedList.search(index: 0)
print("index: 0, value: \(value1)") // Optional("0")
let value2 = linkedList.search(index: 10)
print("index: 0, value: \(value2)") // nil
print("\n\n")


print("----- Delete Test -----")
linkedList.delete(value: "test0")
linkedList.delete(value: "")
linkedList.delete(value: "test3")
linkedList.delete(value: "test2")
//"0", "1", "2", "3", "4"

linkedList.delete(index: 3)
linkedList.delete(index: 0)
linkedList.delete(index: 10)
linkedList.delete(index: 2)

linkedList.showNodes() // "1", "2"
