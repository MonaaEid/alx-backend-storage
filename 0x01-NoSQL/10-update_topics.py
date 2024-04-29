#!/usr/bin/env python3
"""comment"""


def update_topics(mongo_collection, name, topics):
    """comment"""
    mongo_collection.update_many({"name": name}, {"$set": {"topics": topics}})
