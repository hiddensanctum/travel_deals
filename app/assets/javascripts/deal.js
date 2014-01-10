var filter = {
  getCountry: function() {
    this.country = 'country%3D' + document.getElementById("country-code").value
  },
  getStar: function() {
    this.star = 'minStarRating%3D' + $('option[name="minStarRating"]:selected').val();
  },
  getCity: function() {
    this.city = 'city%3D' + document.getElementById("city").value
  },
  getProvince: function() {
    this.province = 'province%3D' + document.getElementById("province").value
  },
  getCheck: function() {
    this.checkin = 'checkInDate%3D' + document.getElementById("checkin").value
  },
  getDays: function() {
    this.day = 'lengthofStay%3D' + document.getElementById("days").value
  },
  getPrice: function() {
    this.price = 'maxTotalRate%3D' + document.getElementById("max-price").value
  },
  setUrl: function() {
    window.location.replace('?options=' + this.country + '%26' + this.star + '%26' + this.price + '%26' + this.city + '%26' + this.day + '%26' + this.province + '%26' + this.checkin)
  },
  render: function() {
    this.getCountry()
    this.getStar()
    this.getPrice()
    this.getCity()
    this.getDays()
    this.getProvince()
    this.getCheck()
    this.setUrl()
  }
}
document.getElementById("submit").onclick = function(){
  filter.render();
}
