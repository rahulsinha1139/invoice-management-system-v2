/**
 * UEC Company Configuration
 * Centralized business information for Unique Engineers Corporation
 */

export const UEC_COMPANY_CONFIG = {
  // Basic Company Information
  fullName: 'Unique Engineers Corporation',
  shortName: 'UEC',
  tagline: 'Authorized Distributors & Engineering Solutions',

  // Contact Information
  address: {
    line1: 'Shop No 1, TIT Complex',
    line2: 'Jabalpur Road, Bargawan',
    city: 'Katni',
    state: 'Madhya Pradesh',
    pinCode: '483501',
    country: 'India'
  },

  contact: {
    primaryPhone: '+91-9425412453',
    secondaryPhone: '+91-9302131864',
    email: 'unique_engineers2000@yahoo.com',
    website: '' // To be updated if available
  },

  // Regulatory Information
  regulatory: {
    gstNumber: '23AACFU6860C2ZD',
    stateCode: '23',
    stateName: 'Madhya Pradesh',
    panNumber: 'AACFU6860C'
  },

  // Banking Information
  banking: {
    bankName: 'State Bank of India',
    accountNumber: '30927872217',
    ifscCode: 'SBIN0004671',
    accountType: 'Current Account'
  },

  // Business Information
  business: {
    authorizedDistributors: [
      'TotalEnergies',
      'Eutectic Castolin',
      'PIX Transmissions'
    ],
    primaryProducts: [
      'Welding Electrodes',
      'Lubricating Oils',
      'Greases',
      'Coolants & Antifreeze'
    ]
  },

  // Key Personnel
  personnel: {
    proprietor: {
      name: 'Mr. Arun Sinha',
      designation: 'Proprietor',
      phone: '+91-9425412453',
      email: 'unique_engineers2000@yahoo.com'
    }
  },

  // Invoice Configuration
  invoice: {
    startNumber: 50,
    prefix: 'UEC',
    yearFormat: '2024',
    format: 'UEC-2024-{number}', // Template for invoice numbers
    terms: 'Payment due within 30 days',
    notes: 'Subject to Katni jurisdiction only'
  },

  // System Configuration
  system: {
    version: 'v2.0.0',
    environment: 'production',
    timezone: 'Asia/Kolkata'
  }
} as const;

// Helper functions for common operations
export const getFullAddress = () => {
  const addr = UEC_COMPANY_CONFIG.address;
  return `${addr.line1}, ${addr.line2}, ${addr.city}, ${addr.state} ${addr.pinCode}, ${addr.country}`;
};

export const getDisplayAddress = () => {
  const addr = UEC_COMPANY_CONFIG.address;
  return `${addr.line1}, ${addr.line2}\n${addr.city}, ${addr.state} ${addr.pinCode}`;
};

export const getContactInfo = () => {
  const contact = UEC_COMPANY_CONFIG.contact;
  return {
    phones: [contact.primaryPhone, contact.secondaryPhone],
    email: contact.email,
    website: contact.website
  };
};

export const getBankingDetails = () => {
  const banking = UEC_COMPANY_CONFIG.banking;
  return `${banking.bankName}\nA/c No: ${banking.accountNumber}\nIFSC: ${banking.ifscCode}`;
};

export const generateInvoiceNumber = (sequenceNumber: number) => {
  const config = UEC_COMPANY_CONFIG.invoice;
  return `${config.prefix}-${config.yearFormat}-${String(sequenceNumber).padStart(3, '0')}`;
};

export const getTaxInfo = () => {
  const reg = UEC_COMPANY_CONFIG.regulatory;
  return {
    gst: reg.gstNumber,
    pan: reg.panNumber,
    stateCode: reg.stateCode,
    stateName: reg.stateName
  };
};

export default UEC_COMPANY_CONFIG;