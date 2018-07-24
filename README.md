# GROUPEVENT

## API

### Get Event
url: /api/v1/group_events
path: get
params:
response: 
```
[
  {
    "name": 'event_name',
    "description": '',
    "number_days": 0,
    "duration": 123,
    "location": 'some_location',
    "start_date": "2018-07-25T22:07:38.000Z",
    "end_date":"2018-07-11T22:07:41.000Z",
    "published":true,
    "is_removed":false
  },
  {
    "name": 'event_name',
    .......
  }
]
```

### Create Event
url: /api/v1/group_events
path: post
params:
```
  {
    group_event: {
      "name": 'event_name',
      "description": '',
      "number_days": 0,
      "duration": 123,
      "location": 'some_location',
      "start_date": "2018-07-25T22:07:38.000Z",
      "end_date":"2018-07-11T22:07:41.000Z",
      "published":true
    }
  }
```
response: 
```
  {
    "name": 'event_name',
    "description": '',
    "number_days": 0,
    "duration": 123,
    "location": 'some_location',
    "start_date": "2018-07-25T22:07:38.000Z",
    "end_date":"2018-07-11T22:07:41.000Z",
    "published":true,
    "is_removed":false
  }
```
### Update Event
url: /api/v1/group_events/group_event.id
path: post
params:
```
  {
    group_event: {
      "name": 'new_name',
      "description": '',
      "number_days": 0,
      "duration": 123,
      "location": 'some_location',
      "start_date": "2018-07-25T22:07:38.000Z",
      "end_date":"2018-07-11T22:07:41.000Z",
      "published":true
    }
  }
```
response: 
```
  {
    "name": 'new_name',
    "description": '',
    "number_days": 0,
    "duration": 123,
    "location": 'some_location',
    "start_date": "2018-07-25T22:07:38.000Z",
    "end_date":"2018-07-11T22:07:41.000Z",
    "published":true,
    "is_removed":false
  }
```

### published Event
url: /api/v1/group_events/#{group_event.id}/published
path: post
params:
response: 
```
  {
    "name": 'new_name',
    "description": '',
    "number_days": 0,
    "duration": 123,
    "location": 'some_location',
    "start_date": "2018-07-25T22:07:38.000Z",
    "end_date":"2018-07-11T22:07:41.000Z",
    "published":true,
    "is_removed":false
  }
```

## Run Test 
 - bundle exec rspec 

