// Lista simplemente enlazada

class Node<T> {
  late T key;
  Node? next;
  Node(T value) {
    key = value;
  }
}

class LinkedList<T> {
  Node? head, tail;

  //Métodos
  void pushFront(T value) {
    Node<T> nuevo = Node<T>(value);
    nuevo.next = head;
    head = nuevo;
    tail ??=
        head; //Si la cola estaba null, se coloca apuntando a la misma cabeza
  }

  T popFront() {
    if (head == null) {
      throw Exception("La lista enlazada está vacía");
    }
    Node dev = head!;
    head = head!.next;
    if (head == null) {
      tail == null;
    }
    return dev.key;
  }

  void pushBack(T item) {
    Node nuevo = Node(item);
    if (tail == null) {
      head = nuevo;
      tail = nuevo;
    } else {
      tail!.next = nuevo;
      tail = nuevo;
    }
  }

  T popBack() {
    late Node dev;
    if (head == null) {
      throw Exception("La lista enlazada está vacía");
    }
    if (head == tail) {
      dev = head!;
      head = null;
      tail = null;
    } else {
      Node p = head!;
      while (p.next!.next != null) {
        p = p.next!;
      }
      dev = p.next!;
      p.next = null;
      tail = p;
    }
    return dev.key;
  }

  void addAfter(node, key) {
    Node node2 = Node(key);
    node2.next = node.next;
    node.next = node2;
    if (tail == node) {
      tail == node2;
    }
  }
}
