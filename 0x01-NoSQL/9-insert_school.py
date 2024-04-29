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
    try:
        result = mongo_collection.insert_one(kwargs)
        new_id = result.inserted_id
        return str(new_id)
    except Exception as e:
        print(f"Error inserting document: {e}")
        return None
