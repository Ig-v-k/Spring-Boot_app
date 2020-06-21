import React, { Component } from 'react';
import {addResponseMessage, Widget} from 'react-chat-widget';

class App extends Component {
    componentDidMount() {
        addResponseMessage("Welcome to this awesome chat!");
    }

    handleNewUserMessage = (newMessage) => {
        console.log(`New message incomig! ${newMessage}`);
        addResponseMessage("Hello!!!");
    }

    render() {
        return (
            <div className="App">
                <Widget
                    handleNewUserMessage={this.handleNewUserMessage}
                    title="My new awesome title"
                    subtitle="And my cool subtitle"
                />
            </div>
        );
    }
}

export default App;