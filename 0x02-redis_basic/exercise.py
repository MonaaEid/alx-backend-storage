#!/usr/bin/python3
"""cach module"""

import redis
import requests
import json


class Cache:
    """Cach Class"""
    def __init__(self):
        """Constructor"""
        self._redis = redis.Redis()
        self._redis.flushdb()


    def store(self, data: str) -> None:
        """Store data in redis"""
        self._redis.set("data", data)

        