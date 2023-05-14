/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React, {useState} from 'react';

import {
  SafeAreaView,
  StyleSheet,
  Text,
  View,
  NativeModules,
  Platform,
  TouchableOpacity,
  UIManager,
  findNodeHandle,
  requireNativeComponent,
} from 'react-native';

let env = 'boş';
const {CopyToClipboard, SampleApp} = NativeModules;
const basicFunc = () => CopyToClipboard.basicFunc();
const withParams = () => CopyToClipboard.funcWithParams('as', 2);
const withCallback = () =>
  CopyToClipboard.basicFuncCallback((fir, sec, trd) => {
    console.log(fir, sec, trd);
  });
const asyncFuncd = async () => {
  const res = await CopyToClipboard.asyncFunc(1, 'sem', 'cak');
  console.log('res', res);

  // CopyToClipboard.asyncFunc(1, 'sem', 'cak')
  //   .then(d => {
  //     console.log('data', d);
  //   })
  //   .catch(e => {
  //     console.log('error', e);
  //   });
};
const copy = text => CopyToClipboard.copy(text);
const paste = (callback = () => {}) =>
  CopyToClipboard.paste(text => {
    callback(text);
  });
const funcWithOptionalParams = (f, s, t, d) => {
  CopyToClipboard.funcWithOptionalParams(f, s, t, d);
};

const navigateToİOSSampleView = () => SampleApp.openSampleApp();
if (Platform.OS === 'android') {
  env = NativeModules.RNConfig.getConstants().env;
} else {
  env = NativeModules.RNConfig.getConstants().env;
  // copy = NativeModules.CopyToClipboard.copy;
}

const environment = 'Prod';
const App = () => {
  const [pastedText, setPastedText] = useState('');
  console.log('env', env);

  return (
    <SafeAreaView style={{backgroundColor: '#DD9AAA', flex: 1}}>
      <View style={{backgroundColor: 'white'}}>
        <Text style={{fontSize: 50}}>React Native Side</Text>
        <Text style={{color: 'red'}}>Ortam- {env} </Text>
        <TouchableOpacity
          style={{
            width: '50%',
            backgroundColor: '#eeccaa',
            padding: 10,
            alignItems: 'center',
          }}
          onPress={() => {
            // basicFunc()
            // withParams();
            // withCallback();
            // asyncFuncd();
            // copy('işte bu !! weyılgen çok basit. ');
            funcWithOptionalParams(null, 2, 3, null);
          }}>
          <Text>Copy e tıkla</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={{
            width: '50%',
            padding: 10,
            backgroundColor: '#aaffee',
            alignItems: 'center',
            marginTop: 10,
          }}
          onPress={() => {
            paste(text => {
              setPastedText(text);
            });
          }}>
          <Text>Yapıştır.</Text>
        </TouchableOpacity>
        <Text>El sonuc : {pastedText}</Text>
        <TouchableOpacity
          style={{
            width: '50%',
            padding: 10,
            backgroundColor: '#cce88F',
            alignItems: 'center',
            marginTop: 10,
          }}
          onPress={() => {
            navigateToİOSSampleView();
            // console.log('SampleApp', SampleApp);
            // console.log('CopyToClipboard', CopyToClipboard);
          }}>
          <Text>İOS a git</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
  },
  highlight: {
    fontWeight: '700',
  },
});

export default App;
