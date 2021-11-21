pragma solidity >=0.4.22 <0.9.0;

contract TodoList {
    // Code goes here...
    uint256 public taskCount = 0;

    struct Task {
        uint256 id;
        string content;
        bool completed;
    }
    // Task created event
    event TaskCreated(uint256 id, string content, bool completed);

    // Task completed event
    event TaskCompleted(uint256 id, bool completed);

    // To look up any task by id
    mapping(uint256 => Task) public tasks;

    // Constuctor
    constructor() public {
        createTask("Check out dappuniversity.com");
    }

    // To create tasks
    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint256 _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }
}
