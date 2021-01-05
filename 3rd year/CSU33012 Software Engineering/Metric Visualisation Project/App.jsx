import React, { Component } from 'react';
import axios from 'axios';
import './style.css';
import Form from './Form.jsx';
import BarChart from './BarChart.jsx';
import ProfileDetails from './Profile.jsx';
import Logo from './githublogo.png'

class App extends Component 
{
  constructor(props) 
  {
    super(props);
    this.state = 
    {
      gitun: 'No username',
      infoclean: '',
      repos: '',
      weeklyCommits:'',
      formData: 
      {
        username: '',
      },
      graphData: 
      {
        label: null,
        datasets: null
      },
      barChartData:
      {
        label: null,
        datasets:null
      }
    }
    this.handleUserFormSubmit = this.handleUserFormSubmit.bind(this);
    this.handleFormChange = this.handleFormChange.bind(this);
  }
  handleUserFormSubmit(event) 
  {
    event.preventDefault();
    //---INSERT GITHUB ACCESS TOKEN BELOW---
    const token = "";
    //--------------------------------------
    this.setState({ infoclean: ' ' }); 
    this.setState({ repos: ' ' });
    axios.get('https://api.github.com/users/' + this.state.formData.username + '/repos?access_token=' + token, {}).then(response 
        => this.setState({ repos: response.data,})).catch((err) => { console.log(err); });

    axios.get('https://api.github.com/users/' + this.state.formData.username + '?access_token=' + token).then(response => this.setState({
      gitun: response.data.login,
      infoclean: ' ',
      infoclean: response.data,
    })).catch((err) => { console.log(err); });

  }

  handleFormChange(event) 
  {
    const obj = this.state.formData;
    obj[event.target.name] = event.target.value;
    this.setState(obj);
  }; render() 
  {
    return (
      <div className="App">
        <div class="header">
          <img src={Logo} alt = 'logo' />
          <br></br>
          <h1>GitHub Profile Analyser</h1>
        </div>
        <br></br>
        <Form 
          formData={this.state.formData}
          handleUserFormSubmit={this.handleUserFormSubmit}
          handleFormChange={this.handleFormChange}
        />
        
        <ProfileDetails infoclean={this.state.infoclean} />
        <BarChart data={this.state.barChartData} infoclean={this.state.infoclean} repos={this.state.repos} formData={this.state.formData}/>
        <div class="my-name">by Mary Coyne</div>
      </div>
    );
  }
} export default App;
