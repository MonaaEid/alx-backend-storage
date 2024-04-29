#!/usr/bin/env python3
"""comment"""


def insert_school(mongo_collection, **kwargs):
    """
    Inserts a new document into the specified MongoDB 
    collection based on keyword arguments.

    Args:
        mongo_collection: A pymongo collection object.
        **kwargs: Keyword arguments representing the 
        attributes and values for the new document.

    Returns:
        str: The _id of the newly inserted document.
    """
    new_doc = mongo_collection.insert_one(kwargs)
    return new_doc.inserted_id
