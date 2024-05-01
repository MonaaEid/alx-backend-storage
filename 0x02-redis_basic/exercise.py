#!/usr/bin/python3
"""cach module"""

import uuid
import json
from typing import Union


class Cache:
    """Cach Class"""
    def __init__(self):
        """Constructor"""
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """Store data in redis"""
        dataKey = str(uuid.uuid4())
        self._redis.set(dataKey, data)
        return dataKey
