import {expect} from 'chai'
import fetch from 'node-fetch'

function Repository() {

  this.add = () => {

  }

  this.getAll = (callback) => {
    fetch('http://localhost:3000/api/v1/components')
      .then(res => res.json())
      .then(json => callback(json));
  }

}

describe("api call", function() {
  it("makes the call", function(done) {
    let repo = new Repository;
    repo.getAll((data) => {
      expect(data).to.deep.equal({components: []})
      done()
    })
  });
});
