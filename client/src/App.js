import './App.css';
import useMe from './hooks/useMe';

function App() {
  const me = useMe();

  return (
    <div className="App">
      {me.username ? `Hello, ${me.username}!` : `Hello, world!`}
    </div>
  );
}

export default App;
