import unittest

from algorithms.distribution import measure
from algorithms.distribution.IIDDistribution import IIDDistribution
from algorithms.distribution import MeasureCompatibilityError


class Test_IIDDistribution(unittest.TestCase):

    def test_QuasiGen_in_IIDClass(self):
        self.assertRaises(MeasureCompatibilityError,IIDDistribution,trueD=measure().lattice())

if __name__ == "__main__":
    unittest.main()