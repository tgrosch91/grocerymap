import React, {Component} from 'react';
import { StyleSheet, Text, View } from 'react-native';
import axios from 'axios';
export default class App extends Component {
  componentWillMount(){
    console.log('whattt');
  }
  render() {
    return (
      <View style={styles.container}>
        <Text>LISA SUCKZ</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
