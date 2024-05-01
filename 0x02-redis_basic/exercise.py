#!/usr/bin/python3
"""cach module"""

import redis
import requests
import json


class Cache:
    """Cach Class"""
    def __init__(self):
        """Constructor"""
        _redis = redis.Redis()
        self._redis = _redis
        self._redis.flushdb()
    

    def store(self, data:str) -> str:
        """Store data in redis"""
        key = str(redis.incr("count"))
        self._redis.set(key, data)
        return key
        