#!/usr/bin/env python3
"""comment"""


def list_all(mongo_collection):
    """
    Lists all documents in the specified MongoDB collection.

    Args:
        mongo_collection: A pymongo collection object.

    Returns:
        list: A list of all documents in the collection.
    """
    try:
        all_documents = list(mongo_collection.find({}))

        return all_documents
    except Exception as e:
        print(f"Error fetching documents: {e}")
        return []
