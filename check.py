import json

def lambda_handler(event, context):
    # Extract 3 people's details from the test event
    people = [
        {'name': event['name1'], 'age': event['age1']},
        {'name': event['name2'], 'age': event['age2']},
        {'name': event['name3'], 'age': event['age3']}
    ]
    
    results = []
    
    # Check eligibility for each person
    for person in people:
        if person['age'] >= 18:
            message = f"{person['name']} (age {person['age']}) is eligible to vote!"
        else:
            message = f"{person['name']} (age {person['age']}) is NOT eligible to vote."
        results.append(message)
    
    return {
        'statusCode': 200,
        'body': json.dumps(results)
    }