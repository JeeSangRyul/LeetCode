/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func buildLinkedList(_ arr: [Int]) -> ListNode? {
        guard !arr.isEmpty else { return nil }

        var head = ListNode(arr[0])
        var currentNode = head
        var i = 1

        while i < arr.count {
            currentNode.next = ListNode(arr[i])
            currentNode = currentNode.next!
            i += 1
        }

        return head
    }

    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var dummy1: ListNode? = headA
        var dummy2: ListNode? = headB

        while dummy1 !== dummy2 {
            dummy1 = (dummy1 != nil) ? dummy1!.next : headB
            dummy2 = (dummy2 != nil) ? dummy2!.next : headA
        }
        return dummy1
    }
}