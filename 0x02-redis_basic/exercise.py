#!/usr/bin/env python3
"""cach module"""

import redis
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

    def get(self, dataKey: str) -> Union[str, bytes, int, float]:
        """Get data from redis"""
        data = self._redis.get(dataKey)
        return data

    def get_str(self, dataKey: str) -> str:
        """Get data from redis as string"""
        data = self._redis.get(dataKey)
        return data.decode("utf-8")

    def get_int(self, dataKey: str) -> int:
        """Get data from redis as integer"""
        data = self._redis.get(dataKey)
        return int(data)
