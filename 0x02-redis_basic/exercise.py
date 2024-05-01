#!/usr/bin/env python3
"""cach module"""

import redis
import uuid
from typing import Any, Callable, Union
from functools import wraps


def count_calls(method: callable) -> callable:
    """Decorator that counts how many times a function is called"""
    key = method.__qualname__

    @wraps(method)
    def wrapper(self, *args, **kwargs):
        """Wrapper function"""
        self._redis.incr(key)
        return method(self, *args, **kwargs)
    return wrapper

def call_history(method: callable) -> callable:
    """Decorator that stores the history of inputs and outputs for a function"""
    key = method.__qualname__
    def wrapper(self, *args, **kwargs):
        """Wrapper function"""
        self._redis.rpush(f"{key}:inputs", str(args))
        result = method(self, *args, **kwargs)
        self._redis.rpush(f"{key}:outputs", str(result))
        return result
    return wrapper


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

    def get(
            self,
            key: str,
            fn: Callable = None,
            ) -> Union[str, bytes, int, float]:
        """Get data from redis"""
        data = self._redis.get(key)
        if fn:
            return fn(data)
        return data

    def get_str(self, dataKey: str) -> str:
        """Get data from redis as string"""
        data = self._redis.get(dataKey)
        return data.decode("utf-8")

    def get_int(self, dataKey: str) -> int:
        """Get data from redis as integer"""
        data = self._redis.get(dataKey)
        return int(data)
