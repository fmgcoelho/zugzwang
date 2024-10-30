import unittest
from bninput import *

class Test(unittest.TestCase):
    def test_valid_file(self):
        result = summary_dag('asia2.bif')
        
        self.assertEqual(result['dag_file'], 'asia2.bif')
        self.assertIsInstance(result['nodes'], list)
        self.assertIsInstance(result['count_parents'], int)
        self.assertIsInstance(result['count_children'], int)
        self.assertIsInstance(result['count_in_edges'], int)
        self.assertIsInstance(result['count_out_edges'], int)