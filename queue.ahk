class Queue {
    __New() {
        this.data := []
    }

    push(value) {
        this.data.Push(value)
    }

    pop() {
        if (this.isEmpty()) {
            return ""
        }
        return this.data.RemoveAt(1)
    }

    peek() {
        if (this.isEmpty()) {
            return ""
        }
        return this.data[1]
    }

    isEmpty() {
        return this.data.MaxIndex() = 0
    }

    size() {
        return this.data.MaxIndex()
    }
}

class Stack {
    __New() {
        this.data := []
    }

    push(value) {
        this.data.Push(value)
    }

    pop() {
        if (this.isEmpty()) {
            return ""
        }
        return this.data.Pop()
    }

    peek() {
        if (this.isEmpty()) {
            return ""
        }
        return this.data[this.data.MaxIndex()]
    }

    isEmpty() {
        return this.data.MaxIndex() = 0
    }

    size() {
        return this.data.MaxIndex()
    }
}

class Deque {
    __New() {
        this.data := []
    }

    pushFront(value) {
        this.data.InsertAt(1, value)
    }

    pushBack(value) {
        this.data.Push(value)
    }

    popFront() {
        if (this.isEmpty()) {
            return ""
        }
        return this.data.RemoveAt(1)
    }

    popBack() {
        if (this.isEmpty()) {
            return ""
        }
        return this.data.Pop()
    }

    peekFront() {
        if (this.isEmpty()) {
            return ""
        }
        return this.data[1]
    }

    peekBack() {
        if (this.isEmpty()) {
            return "" 
        }
        return this.data[this.data.MaxIndex()]
    }

    isEmpty() {
        return this.data.MaxIndex() = 0
    }

    size() {
        return this.data.MaxIndex() 
    }
}

class BinaryHeap {
    __New(isMinHeap := true, comparator := this._compare) {
        this.heap := []
        this.isMinHeap := isMinHeap
        this._compare := comparator
    }

    insert(value) {
        this.heap.Push(value) 
        this._heapifyUp(this.heap.MaxIndex()) 
    }

    removeRoot() {
        if (this.isEmpty()) {
            return ""
        }

        root := this.heap[1] 
        this.heap[1] := this.heap.Pop() 
        this._heapifyDown(1) 
        return root
    }

    isEmpty() {
        return this.heap.MaxIndex() = 0
    }

    _heapifyUp(index) {
        while (index > 1) {
            parentIndex := this._getParentIndex(index)
            if (this._compare(this.heap[index], this.heap[parentIndex])) {
                this._swap(index, parentIndex)
                index := parentIndex
            } else {
                break
            }
        }
    }

    _heapifyDown(index) {
        size := this.heap.MaxIndex()
        while (true) {
            leftChildIndex := this._getLeftChildIndex(index)
            rightChildIndex := this._getRightChildIndex(index)
            smallestOrLargest := index

            if (leftChildIndex <= size && this._compare(this.heap[leftChildIndex], this.heap[smallestOrLargest])) {
                smallestOrLargest := leftChildIndex
            }

            if (rightChildIndex <= size && this._compare(this.heap[rightChildIndex], this.heap[smallestOrLargest])) {
                smallestOrLargest := rightChildIndex
            }

            if (smallestOrLargest = index) {
                break
            }

            this._swap(index, smallestOrLargest)
            index := smallestOrLargest
        }
    }

    _compare(a, b) {
        if (this.isMinHeap) {
            return a < b
        } else {
            return a > b
        }
    }

    _getParentIndex(index) {
        return floor(index / 2)
    }

    _getLeftChildIndex(index) {
        return 2 * index
    }

    _getRightChildIndex(index) {
        return 2 * index + 1
    }

    _swap(index1, index2) {
        temp := this.heap[index1]
        this.heap[index1] := this.heap[index2]
        this.heap[index2] := temp
    }
}

class PriorityQueue {
    __New(isMinHeap := true, comparator := BinaryHeap._compare) {
        this.heap := BinaryHeap(isMinHeap, comparator)
    }

    insert(value) {
        this.heap.insert(value)
    }

    remove() {
        return this.heap.removeRoot()
    }

    isEmpty() {
        return this.heap.isEmpty()
    }
}