#!/usr/bin/env python3
"""function that returns the list of school having a specific topic:"""


def schools_by_topic(mongo_collection, topic):
    """
    Returns the list of school having a specific topic.

    Args:
        mongo_collection: A pymongo collection object.
        topic: A string representing the topic searched.

    Returns:
        List: A list of school documents having the specified topic.
    """
    return mongo_collection.find({"topics": topic})
