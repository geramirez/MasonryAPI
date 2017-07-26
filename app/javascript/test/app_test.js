import {expect} from 'chai'
import fetch from 'node-fetch'

function Repository() {
  this.getAll = async () => {
    return await fetch('http://localhost:3000/api/v1/components')
      .then(res => res.json())
  }
}

function FakeRepository() {
  this.getAll = async () => {
    return {components: []}
  }
}

describe("Real Contract Test", function() {
  it("makes the call", async function() {
    let repo = new Repository;
    let data = await repo.getAll()
    expect(data).to.deep.equal({components: []})
  })
});

describe("Fake Contract Test", function() {
  it("makes the call", async function() {
    let repo = new FakeRepository;
    let data = await repo.getAll()
    expect(data).to.deep.equal({components: []})
});
});

