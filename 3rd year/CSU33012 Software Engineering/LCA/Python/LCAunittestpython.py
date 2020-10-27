import unittest
import Node

class LCAunittestpython(unittest.TestCase):

    def test_node4_5(self):
        self.assertEqual(Node.findLCA(Node.root, 4, 5).key, 2)

    def test_node6_2(self):
        self.assertEqual(Node.findLCA(Node.root, 6, 2).key, 1)

    def test_node_same(self):
        self.assertEqual(Node.findLCA(Node.root, 1, 1).key, 1)

    def test_node2_3(self):
        self.assertEqual(Node.findLCA(Node.root, 2, 3).key, 1)

    def test_node6_7(self):
        self.assertEqual(Node.findLCA(Node.root, 6, 7).key, 3)

    def test_node_fake(self):
        self.assertEqual(Node.findLCA(Node.root, 8, 8), None)


if __name__ == '__main__':
    unittest.main()
