import pytest
import json
from app import app

@pytest.fixture
def client():
    """Create a test client for the app."""
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home_endpoint(client):
    """Test the home endpoint returns expected JSON."""
    response = client.get('/')
    assert response.status_code == 200
    
    data = json.loads(response.data)
    assert 'message' in data
    assert 'status' in data
    assert data['status'] == 'running'
    assert 'Hello World' in data['message']
    print("✓ Home endpoint test passed")

def test_health_endpoint(client):
    """Test the health endpoint returns healthy status."""
    response = client.get('/health')
    assert response.status_code == 200
    
    data = json.loads(response.data)
    assert data['status'] == 'healthy'
    assert data['service'] == 'demo-app'
    assert 'timestamp' in data
    print("✓ Health endpoint test passed")

def test_info_endpoint(client):
    """Test the info endpoint returns app information."""
    response = client.get('/info')
    assert response.status_code == 200
    
    data = json.loads(response.data)
    assert 'app' in data
    assert 'framework' in data
    assert data['framework'] == 'Flask'
    assert 'endpoints' in data
    assert len(data['endpoints']) >= 3
    print("✓ Info endpoint test passed")

def test_invalid_endpoint(client):
    """Test that invalid endpoints return 404."""
    response = client.get('/invalid')
    assert response.status_code == 404
    print("✓ Invalid endpoint test passed")

if __name__ == '__main__':
    pytest.main([__file__, '-v'])
