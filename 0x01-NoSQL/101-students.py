#!/usr/bin/env python3
"""function that returns all students sorted by average score:"""


def top_students(mongo_collection):
    """Returns all students sorted by average score."""
    return mongo_collection.aggregate([
        {"$unwind": "$scores"},
        {"$group": {
            "_id": "$_id",
            "averageScore": {"$avg": "$scores.score"},
            "name": {"$first": "$name"}
        }},
        {"$sort": {"averageScore": -1}}
    ])
