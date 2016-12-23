// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery.remotipart
//= require turbolinks
//= require_tree .

$(document).on("turbolinks:load", function() {

  var itemLocation = $('#ad_item_location').val();

  getItemArea(itemLocation);

  $('#ad_item_location').change(function() {
    var itemLocation = $('#ad_item_location').val();
    getItemArea(itemLocation)
  });

  function getItemArea(itemLocation) {
    $('#ad_item_area  option').remove();
    switch(itemLocation) {
      case 'Johor':
        var area = ['Batu Pahat', 'Johor Bahru', 'Pontian', 'Yong Peng', 'Others'];
        for (var i = 0; i < area.length; i++) {
          $('#ad_item_area').append($('<option>', {
            value: area[i],
            text: area[i]
          }));
        }
        break;
      case 'Kedah':
        var area = ['Alor Setar', 'Kulim', 'Pulau Langkawi', 'Simpang Empat', 'Others']
        for (var i = 0; i < area.length; i++) {
          $('#ad_item_area').append($('<option>', {
            value: area[i],
            text: area[i]
          }));
        }
        break;
      case 'Kelantan':
        var area = ['Gua Musang', 'Kota Bharu', 'Pasir Putih', 'Others']
        for (var i = 0; i < area.length; i++) {
          $('#ad_item_area').append($('<option>', {
            value: area[i],
            text: area[i]
          }));
        }
        break;
      case 'Kuala Lumpur':
        var area = ['Bandar Damai Perdana', 'Bangsar', 'Kuchai Lama', 'Setapak', 'Others']
        for (var i = 0; i < area.length; i++) {
          $('#ad_item_area').append($('<option>', {
            value: area[i],
            text: area[i]
          }));
        }
        break;
      case 'Melaka':
        var area = ['Ayer Keroh', 'Bukit Beruang', 'Durian Tunggal', 'Others']
        for (var i = 0; i < area.length; i++) {
          $('#ad_item_area').append($('<option>', {
            value: area[i],
            text: area[i]
          }));
        }
        break;
      case 'Negeri Sembilan':
        var area = ['Bahau', 'Nilai', 'Port Dickson', 'Others']
        for (var i = 0; i < area.length; i++) {
          $('#ad_item_area').append($('<option>', {
            value: area[i],
            text: area[i]
          }));
        }
        break;
      case 'Pahang':
        var area = ['Bentong', 'Cameron Highlands', 'Raub', 'Others']
        for (var i = 0; i < area.length; i++) {
          $('#ad_item_area').append($('<option>', {
            value: area[i],
            text: area[i]
          }));
        }
        break;
      case 'Penang':
        var area = ['Balik Pulau', 'Georgetown', 'Seberang Jaya', 'Others']
        for (var i = 0; i < area.length; i++) {
          $('#ad_item_area').append($('<option>', {
            value: area[i],
            text: area[i]
          }));
        }
        break;
      case 'Perak':
        var area = ['Batu Gajah', 'Ipoh', 'Kampar', 'Others']
        for (var i = 0; i < area.length; i++) {
          $('#ad_item_area').append($('<option>', {
            value: area[i],
            text: area[i]
          }));
        }
        break;
      case 'Perlis':
        var area = ['Kangsar', 'Kuala Perlis', 'Padang Besar', 'Others']
        for (var i = 0; i < area.length; i++) {
          $('#ad_item_area').append($('<option>', {
            value: area[i],
            text: area[i]
          }));
        }
        break;
      case 'Putrajaya':
        var area = ['Putrajaya']
        for (var i = 0; i < area.length; i++) {
          $('#ad_item_area').append($('<option>', {
            value: area[i],
            text: area[i]
          }));
        }
        break;
      case 'Selangor':
        var area = ['Bandar Utama', 'Damansara Utama', 'Kota Damansara', 'Subang', 'Others']
        for (var i = 0; i < area.length; i++) {
          $('#ad_item_area').append($('<option>', {
            value: area[i],
            text: area[i]
          }));
        }
        break;
      case 'Sabah':
        var area = ['Kota Kinabalu', 'Lahad Datu', 'Tawau', 'Others']
        for (var i = 0; i < area.length; i++) {
          $('#ad_item_area').append($('<option>', {
            value: area[i],
            text: area[i]
          }));
        }
        break;
      case 'Sabah':
        var area = ['Bintulu', 'Kuching', 'Miri', 'Others']
        for (var i = 0; i < area.length; i++) {
          $('#ad_item_area').append($('<option>', {
            value: area[i],
            text: area[i]
          }));
        }
        break;
      case 'Terengganu':
        var area = ['Dungun', 'Kuala Terengganu', 'Marang', 'Others']
        for (var i = 0; i < area.length; i++) {
          $('#ad_item_area').append($('<option>', {
            value: area[i],
            text: area[i]
          }));
        }
        break;
    }
  }

});